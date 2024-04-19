import pandas as pd
import streamlit as st

df = pd.read_csv("../assets/data.csv", sep=";").T

st.write(df)
