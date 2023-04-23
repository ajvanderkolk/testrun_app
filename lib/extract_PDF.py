import sys
import PyPDF2
import nltk
from nltk.corpus import stopwords

# read PDF file from standard input
pdf_bytes = sys.stdin.buffer.read()

# create pdf reader object
reader = PyPDF2.PdfFileReader(pdf_bytes)

# printing number of pages in pdf file
print(len(reader.pages))

# iterate over all pages in pdf file
for page_num in range(reader.numPages):
    # get the page object
    page = reader.getPage(page_num)

    # extracting text from page
    text = page.extractText()
    print(text)

    # tokenize and clean text
    tokens = nltk.word_tokenize(text)
    stop_words = set(stopwords.words('english'))
    filtered_text = [word for word in tokens if not word.lower() in stop_words and word.isalpha()]
    clean_text = [word.lower() for word in filtered_text if word.isalpha()]

    # write clean text to file
    with open('extracted_text_three.txt', 'a') as f:
        f.write(f'Page {page_num+1}:\n')
        f.write(' '.join(clean_text) + '\n')
