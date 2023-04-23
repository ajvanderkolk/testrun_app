from tkinter import filedialog
from tkinter import *
from PyPDF2 import PdfReader
import nltk
from nltk.corpus import stopwords

# create a Tkinter root window
root = Tk()
root.withdraw()  # hide the root window

# prompt user to select a file
file_path = filedialog.askopenfilename(filetypes=[('PDF files', '*.pdf')])

# create pdf reader object
reader = PdfReader(file_path)

# printing number of pages in pdf file
print(len(reader.pages))

# iterate over all pages in pdf file
for page_num, page in enumerate(reader.pages):
    # extracting text from page
    text = page.extract_text()
    print(text)

    # tokenize and clean text
    tokens = nltk.word_tokenize(text)
    stop_words = set(stopwords.words('english'))
    filtered_text = [word for word in tokens if not word.lower() in stop_words and word.isalpha()]
    clean_text = [word.lower() for word in filtered_text if word.isalpha()]

    # write clean text to file
    with open('extracted_text.txt', 'a') as f:
        f.write(f'Page {page_num+1}:\n')
        f.write(' '.join(clean_text) + '\n')