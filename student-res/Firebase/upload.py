
import firebase_admin
from firebase_admin import credentials, firestore
from urllib.parse import urlparse
import os


cred = credentials.Certificate("serviceAccountKey.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

pdf_urls = [
    "https://res.cloudinary.com/.../pdf1.pdf",
    "https://res.cloudinary.com/.../pdf2.pdf",
    "https://res.cloudinary.com/.../pdf3.pdf",
    # Add all URLs here
]

for url in pdf_urls:
    # Extract filename from URL to use as name
    parsed_url = urlparse(url)
    pdf_name = os.path.basename(parsed_url.path)

    # Check if this PDF already exists in Firestore
    existing = db.collection("questionpaperpdfs").where("url", "==", url).get()
    if existing:
        print(f" Already exists: {pdf_name}")
        continue

    # Add PDF to Firestore
    try:
        db.collection("questionpaperpdfs").add({
            "name": pdf_name,
            "url": url
        })
        print(f" Added: {pdf_name}")
    except Exception as e:
        print(f" Failed to add {pdf_name}: {e}")







