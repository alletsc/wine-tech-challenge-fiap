import pandas as pd


def load_data():
    return pd.read_csv("tests/assets/data.csv")


def test_datraframe_loading():
    """Test that the dataframe is not empty."""
    df = load_data()
    assert df.empty == False
