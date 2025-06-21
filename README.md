# 📦 MemoNeet Internship Assignment

This project is a mobile e-commerce frontend built using **Flutter** and a mock backend built using **Node.js + Express**. It showcases product listings, discount application, and a direct "Buy Now" flow.

---

## 📱 Features

- Product list screen with category and tag filters (e.g., NEET 2024, Biology, Notes)
- Discount coupon functionality (`MemoNeetAchiever`)
- Buy Now flow with purchase confirmation
- Banner carousel
- Product detail layout with price breakdown and “Purchased” tag
- Backend API integration using HTTP

---

## 🖥️ Backend Setup (Node.js)

> Follow these steps to start the server:

```bash
cd server
npm run dev
```

- Server runs at: `http://localhost:3000`
- If testing on a physical device, replace `localhost` with your local IP (e.g., `http://<Your-IP-Address>:3000`)

### ✨ Available API Endpoints

| Method | Endpoint    | Description                           |
| ------ | ----------- | ------------------------------------- |
| GET    | `/products` | Returns a list of all products        |
| POST   | `/purchase` | (Optional) Records a product purchase |

---

## 📲 Frontend Setup (Flutter)

### Requirements

- Flutter SDK
- Android/iOS Emulator or real device

### Run the App

```bash
flutter pub get
flutter run
```

Make sure your device or emulator is running. If you are using a real device, replace the base URL in `api_service.dart` with your local IP address.

---

## 💸 Discount Coupon

Use the following coupon at checkout:

```
Coupon Code: MemoNeetAchiever
Offer: ₹300 off on minimum purchase of ₹1800
```

---

## 📁 Folder Structure Overview

```
lib/
├── models/
│   └── product_model.dart
├── services/
│   └── api_service.dart
├── widgets/
│   ├── product_card.dart
│   └── banner_carousel.dart
├── screens/
│   ├── home_screen.dart
│   └── purchase_success_screen.dart
```
