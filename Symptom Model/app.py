from flask import Flask, request, jsonify
import pickle
import pandas as pd

# Load the trained model
with open('model.pkl', 'rb') as f:
    model = pickle.load(f)

data = pd.read_csv('Training.csv')
data = data.drop(columns=['Unnamed: 133'])  # Remove the extra column
X = data.iloc[:, :-1]  # Get all columns except the last one (prognosis)

app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
    symptoms = request.json['symptoms']
    input_data = [float(symptom in symptoms) for symptom in list(X.columns)]

    prediction = model.predict([input_data])
    disease = prediction[0]

    return jsonify({'disease': disease})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')  # Allow connections from any IP
