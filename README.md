# Customer Churn Prediction

An end-to-end machine learning project for predicting telecom customer churn
and translating model outputs into actionable retention insights. The project
combines a reproducible notebook workflow with an interactive Streamlit
application for customer-level risk scoring and model interpretation.

## Overview

The project uses the IBM Telco Customer Churn dataset to:

- Explore customer demographics, services, contract types, and billing data.
- Clean and preprocess numeric and categorical features.
- Train and compare Logistic Regression, Random Forest, and XGBoost models.
- Estimate churn probability for an individual customer.
- Explain predictions with SHAP visualizations.
- Surface the strongest churn drivers and business-focused retention actions.

## Application features

The Streamlit dashboard provides:

- Customer profile and service-detail inputs.
- Model selection across three trained classifiers.
- Churn probability with high-, medium-, and low-risk indicators.
- SHAP waterfall explanations for individual predictions.
- Feature-importance, SHAP summary, and SHAP bar visualizations.
- Model performance comparison and business recommendations.

## Project structure

| File | Description |
| --- | --- |
| `app.py` | Streamlit application for interactive predictions and insights. |
| `customer_churn_prediction.ipynb` | Data exploration, preprocessing, training, and evaluation workflow. |
| `WA_Fn-UseC_-Telco-Customer-Churn.csv` | Telco customer churn dataset used for analysis and training. |
| `logistic_model.pkl` | Serialized Logistic Regression pipeline. |
| `rf_model.pkl` | Serialized Random Forest pipeline. |
| `xgb_model.pkl` | Serialized XGBoost pipeline. |
| `requirements.txt` | Python dependencies required to run the project. |

## Getting started

### Prerequisites

- Python 3.10 or later
- Git

### Installation

Clone the repository and create a virtual environment:

```bash
git clone https://github.com/amon2100/customer-churn-prediction.git
cd customer-churn-prediction
python -m venv .venv
```

Activate the environment:

**Windows PowerShell**

```powershell
.venv\Scripts\Activate.ps1
```

**macOS/Linux**

```bash
source .venv/bin/activate
```

Install the dependencies:

```bash
python -m pip install -r requirements.txt
```

## Run the application

Launch the Streamlit dashboard:

```bash
streamlit run app.py
```

The application resolves the serialized models relative to `app.py`, so it
does not depend on the terminal's current working directory.

## Run the notebook

To reproduce the analysis and training workflow:

```bash
jupyter notebook
```

Open `customer_churn_prediction.ipynb` and run the cells in order. The notebook
expects the CSV dataset to be located in the project directory.

## Model evaluation

The application includes the following evaluation summary:

| Model | ROC AUC | F1 Score | Precision | Recall |
| --- | ---: | ---: | ---: | ---: |
| Logistic Regression | 0.86 | 0.64 | 0.52 | 0.84 |
| Random Forest | 0.85 | 0.65 | 0.56 | 0.78 |
| XGBoost | 0.85 | 0.63 | 0.55 | 0.75 |

These metrics are provided as project evaluation results and should be
recalculated when the training data, preprocessing, or model configuration
changes.

## Business insights

The analysis identifies several factors associated with increased churn risk:

- Shorter customer tenure.
- Month-to-month contracts.
- Higher monthly charges.
- Fiber optic internet service.
- Lack of value-added services such as online security and technical support.

Potential retention strategies include incentivizing longer-term contracts,
bundling support and security services, and prioritizing new or high-charge
customers for targeted retention offers.

## Technology stack

- Python
- pandas and NumPy
- scikit-learn
- XGBoost
- SHAP
- Streamlit
- Matplotlib
- Jupyter

## Disclaimer

This project is intended for educational and portfolio purposes. Predictions
are model-based estimates and should be validated against current business
data before being used in operational customer-retention decisions.

## License

No license has been specified for this repository.
