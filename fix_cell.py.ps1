$ErrorActionPreference = 'Stop'
$path = 'e:\customer-churn-prediction\customer_churn_prediction.ipynb'
$nb = Get-Content -Raw $path | ConvertFrom-Json

$idx = [array]::FindIndex($nb.cells, [Predicate[object]] { param($c) ($c.source -join '') -match 'classifier__n_estimators' })
if ($idx -lt 0) { Write-Output 'CELL NOT FOUND'; exit 1 }

$newSource = @(
    'from sklearn.model_selection import GridSearchCV',
    '',
    '# 1. Define the parameters with actual values inside lists',
    "# NOTE: keys must use the step name inside the pipeline (rf_model uses 'model'),",
    "# NOT 'classifier' - that step name belongs to the LogisticRegression pipeline (clf_pipeline).",
    'param_grid = {',
    "    'model__n_estimators': [100, 200, 300],",
    "    'model__max_depth': [None, 10, 20],",
    "    'model__min_samples_split': [2, 5, 10]",
    '}',
    '',
    '# 2. Setup your GridSearchCV using the RandomForest pipeline so preprocessing runs inside each fold',
    'grid_rf = GridSearchCV(',
    '    rf_model,  # RF pipeline from cell 26: preprocessor + RandomForestClassifier',
    '    param_grid,',
    "    scoring='roc_auc',",
    '    cv=3,',
    '    n_jobs=-1,',
    '    verbose=2',
    ')',
    '',
    '# 3. Run the search',
    'grid_rf.fit(X_train, y_train)',
    ''
)

$nb.cells[$idx].source = $newSource
$nb.cells[$idx].outputs = @()
$nb.cells[$idx].execution_count = $null

$nb | ConvertTo-Json -Depth 100 | Set-Content -Path $path -Encoding UTF8
Write-Output "Fixed cell index $idx (display cell $($idx + 1))"
