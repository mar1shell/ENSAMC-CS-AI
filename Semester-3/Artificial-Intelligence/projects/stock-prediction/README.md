# Stock Prediction Project

A machine learning project for predicting Microsoft (MSFT) stock price movements using multiple AI techniques. This project is made for my AI class.

> **Note**: This project is available in a separate repository: [mar1shell/stock-prediction](https://github.com/mar1shell/stock-prediction)

## Overview

This project implements and compares three different approaches to predict whether Microsoft stock will go UP or DOWN the next day:

- **Logistic Regression** - Baseline binary classifier
- **Random Forest** - Ensemble learning method
- **LSTM Neural Network** - Deep learning for time series

## Features

The model uses technical indicators as input features:

- Daily returns (% change)
- RSI (Relative Strength Index)
- Volatility (rolling standard deviation)

## Dataset

- **Source**: Yahoo Finance (via `yfinance` API)
- **Period**: 10 years of historical data
- **Ticker**: MSFT (Microsoft Corporation)

## Technologies

- Python 3.x
- TensorFlow/Keras (LSTM)
- Scikit-learn (ML models)
- Pandas, NumPy (data processing)
- Matplotlib, Seaborn (visualization)

## Usage

Open and run `model.ipynb` in Jupyter Notebook to:

1. Download stock data
2. Engineer technical features
3. Train and evaluate all three models
4. Compare performance metrics

## Results

The notebook includes:

- Model accuracy scores
- Confusion matrices
- Classification reports
- Performance comparisons

---

<p align="center">Made with ❤️ by <a href="https://github.com/mar1shell" style="text-decoration:none; font-weight:bold; font-style:italic">mar1shell</a></p>
