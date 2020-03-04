# Multi-label text classification with fastText and StarSpace

## Tutorial: Automatic Tag Generation for StackOverflow Questions

### By: Pablo Campos Viana

## Requirements

This tutorial assumes a standard installation of [Anaconda](http://continuum.io/downloads) (based on Python 3.5) that is ready to use, running on a Linux system. Ideally you should be able to follow this tutorial using a Docker container.

The following tools are required:

- gcc
- g++
- make
- cmake
- unzip

 Additionally the following Python libraries are required (included in the `requirements.txt` file.
 
-  [pandas 0.25](https://pandas.pydata.org/pandas-docs/stable/) (or higher)
- [wordcloud](https://pypi.org/project/wordcloud/)
-  [Kaggle API](https://pypi.org/project/kaggle/)
- [fastText](https://pypi.org/project/fasttext/)

## Files and folders

The following files are provided:

- ``requirements.txt``: Text file with the required Python libraries.
- ``install_starspace.sh``: The shell script to install StarSpace (CLI tool), based on its [documentation]([https://github.com/facebookresearch/StarSpace](https://github.com/facebookresearch/StarSpace)).
- ``install_fasttext.sh``: The shell script to install fastText (CLI tool) using **cmake**, based on its [documentation]([https://github.com/facebookresearch/fastText#building-fasttext-using-cmake](https://github.com/facebookresearch/fastText#building-fasttext-using-cmake)).
- ``Model_Building.ipynb``: The development notebook used for this tutorial and required to reproduce the results.

After running the notebook, the following folders will be created:
- */stacksample*: It will contain the  ``Questions.csv`` and ``Tags.csv`` tables downloaded via the Kaggle API after executing the notebook.
- */data*: It will contain the ``train``,``valid``, and ``test`` text files required for both fastText and StarSpace.
- */models*: It will contain the fastText and StarSpace model files.
- */predictions*: It will contain raw and processed text files with predictions for the test data, after inference with fastText and StarSpace.

Additionally, you will require to download a Kaggle token (a `kaggle.json` file containing your Kaggle API credentials, more info [here](https://github.com/Kaggle/kaggle-api)) so you can copy and paste the credentials to declare environment variables inside the notebook and download the [stacksample](https://www.kaggle.com/stackoverflow/stacksample) data.
