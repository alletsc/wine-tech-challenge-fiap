import os

from setuptools import find_packages, setup


def read(*paths):
    """Read the content of a text file safely."""
    root_path = os.path.dirname(__file__)
    filepath = os.path.join(root_path, *paths)
    with open(filepath) as file_:
        return file_.read().strip()


def read_requirements(path):
    """Read the content of the requirements file."""
    return [
        line.strip()
        for line in read(path).split("\n")
        if not line.startswith(("#", "git", '"', "-"))
    ]


setup(
    name="wine-project",
    version="0.1.0",
    description="Wine dashboard project with Streamlit",
    author="S. Costa",
    packages=find_packages(),
    entry_points={"console_scripts": ["dashboard = app.__main__:main"]},
    install_requires=read("requirements.txt"),
)
