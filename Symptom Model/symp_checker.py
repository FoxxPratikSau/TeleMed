from flask import Flask, request, jsonify
import json
import pickle
import numpy as np

# Load the model
with open('model.pkl', 'rb') as file:
    model = pickle.load(file)

# Assuming you have a variable 'X' representing the features (symptoms) in your dataset
symptom_columns = list(X.columns)

symptom_dict = {symptom: i for i, symptom in enumerate(symptom_columns)}

app = Flask(__name__)

def get_disease_prediction(symptoms):
    input_vector = np.zeros(len(symptom_dict), dtype=int)

    for symptom in symptoms:
        if symptom in symptom_dict:
            input_vector[symptom_dict[symptom]] = 1

    prediction = model.predict([input_vector])[0]
    return prediction

@app.route('/predict', methods=['POST'])
def predict():
    try:
        symptoms = request.json['symptoms']
    except KeyError:
        return jsonify({'error': 'Symptoms not provided'}), 400

    prediction = get_disease_prediction(symptoms)
    return jsonify({'disease': prediction})

if __name__ == '__main__':
    app.run(debug=True)
