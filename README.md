# Multi-label text classification with fastText and StarSpace

## Tutorial: Automatic Tag Generation for StackOverflow Questions

### By: Pablo Campos Viana

## Overview
This tutorial shows how to perform multi-label classification with two [Facebook AI Research](https://ai.facebook.com/)'s tools: [fastText](https://fasttext.cc/) and [StarSpace](https://research.fb.com/downloads/starspace/). We will use the [stacksample](https://www.kaggle.com/stackoverflow/stacksample) data to perform automatic tag generation. More precisely, given (short) text of questions titles, we want to predict their most probable tags. 

## Requirements

This tutorial assumes a standard installation of [miniconda](https://docs.conda.io/en/latest/miniconda.html) (based on Python 3.7) that is ready to use, running on a Linux system. Ideally you should be able to follow this tutorial using a Docker container.

The following tools are required:

- gcc
- g++
- make
- cmake
- unzip

Apart from the basic stack (numpy, pandas, scikit-learn, matplotlib) the following Python libraries are required (included in the `requirements.txt` file).
 
- [nltk](https://pypi.org/project/nltk/)
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
- */Starspace*: It will contain the Starspace's repo. files.
- */fastText*: It will contain the fastText's repo. files.
- */data*: It will contain the ``train``,``valid``, and ``test`` text files in the appropiate format required for both fastText and StarSpace. Also the ``train_weighted`` file to perform training with label weights with StarSpace. 
- */models*: It will contain the fastText and StarSpace model files.
- */predictions*: It will contain raw and processed text files with predictions for the test data, after inference with fastText and StarSpace.

Additionally, you will require to download a Kaggle token (a `kaggle.json` file containing your Kaggle API credentials, more info [here](https://github.com/Kaggle/kaggle-api)) so you can copy and paste the credentials to declare environment variables inside the notebook and download the stacksample data.
