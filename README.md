![TeleMed](images/TelemedLogo.png)

# TeleMed

TeleMed is a Flutter-based mobile app designed to provide medical assistance to people living in remote areas who have limited access to top doctors. The app allows users to scan MRI and CT scans to identify brain tumors, skin cancer, and lung cancer. Additionally, the app includes a symptom checker, contact with top doctors through in-app chat, in-app call, and in-app video call, appointment booking, and the ability to purchase prescribed medicines from the doctor.

## Features

- Medical Imaging: Scan MRI and CT scans, and identify brain tumors, skin cancer, and lung cancer using ML models.
- Symptom Checker: Predict the reason behind the symptoms based on the selected symptoms.
- Contact Top Doctors: Communicate with top doctors through in-app chat, in-app call, and in-app video call.
- Book Appointment: Choose a date and time slot to book an appointment.
- Shop Prescribed Medicines: Purchase prescribed medicines directly from the doctor.
- Flask Backend Server: The app integrates with the ML models through Flask backend server.
- User Authentication: Firebase is used for user authentication.
- Payment Gateway: Razorpay gateway is enabled for payments.

## Getting Started

These instructions will help you get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Flutter
- Android Studio or Visual Studio Code
- Firebase Account
- Razorpay Account

### Installation

1. Clone the repository
   https://github.com/FoxxPratikSau/TeleMed.git

2. Change directory
   cd TeleMed

3. Install dependencies
   flutter pub get

4. Setup Firebase

- Create a new Firebase project and download the `google-services.json` file.
- Place the file in the `android/app` directory.
- Follow the instructions for setting up Firebase Authentication.

5. Setup Razorpay

- Create a new Razorpay account and follow the instructions to get API keys.
- Update the API keys in the `lib/screens/cart_page.dart` file.

6. Run the app
   flutter run

## Contributing

If you want to contribute to this project, you can follow these steps:

1. Fork this repository.
2. Create a new branch with a descriptive name.
3. Make changes and commit them.
4. Push the changes to your forked repository.
5. Create a pull request.

## Authors

- [Nitin Chandra Sahu](https://github.com/sahunitin023)
- [Pratik Ranjan Sau](https://github.com/FoxxPratikSau)
- Ravi Kumar
- [Dibya Ranjan Sahu](https://github.com/dibyacoder)
