const express = require("express");
const otpController = require("../controllers/otpController");

const router = express.Router();

// Route for sending OTP
router.post("/send-otp", otpController.sendOTP);

// Route for verifying OTP
router.post("/verify-otp", otpController.verifyOTP);

module.exports = router;
