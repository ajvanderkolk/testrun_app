import PyPDF2
import nltk
from nltk.corpus import stopwords
import sys
import logging
import subprocess

# configure logging to print to console
logging.basicConfig(level=logging.DEBUG, format='%(asctime)s %(levelname)s %(message)s')

# get the path of the selected file
file_path = sys.argv[1]

processResult = subprocess.run(['python', 'extract_text.py', file_path], capture_output=True, text=True)

# use logging to print to console
logging.info('Python Console Output: {}'.format(processResult.stdout))

# create pdf reader object
with open(file_path, 'rb') as file:
    reader = PyPDF2.PdfFileReader(file)

# printing number of pages in pdf fileno
print(len(reader.pages))

# iterate over all pages in pdf file
for page_num in range(reader.numPages):
    # get the page object
    page = reader.getPage(page_num)

    # extracting text from page
    text = page.extractText()
    print(f"Extracted text from page {page_num + 1}: {text}")

    # tokenize and clean text
    tokens = nltk.word_tokenize(text)
    stop_words = set(stopwords.words('english'))
    filtered_text = [word for word in tokens if not word.lower() in stop_words and word.isalpha()]
    clean_text = [word.lower() for word in filtered_text if word.isalpha()]

    # write clean text to file
    with open('extracted_text.txt', 'a') as f:
        f.write(f'Page {page_num+1}:\n')
        f.write(' '.join(clean_text) + '\n')