const otpGenerator = require("otp-generator");
const crypto = require("crypto");
const { Vonage } = require("@vonage/server-sdk");

const vonage = new Vonage({
  apiKey: "YOUR_VONAGE_API_KEY",
  apiSecret: "YOUR_VONAGE_API_SECRET",
});

const sendOTP = async (req, res) => {
  try {
    const otp = otpGenerator.generate(4, {
      upperCaseAlphabets: false,
      specialChars: false,
      lowerCaseAlphabets: false,
    });

    const time_to_live = 3 * 60 * 1000;
    const expires = Date.now() + time_to_live;
    const data = `${req.body.phone}.${otp}.${expires}`;
    const hash = crypto
      .createHmac("sha256", process.env.Crypto_Key)
      .update(data)
      .digest("hex");

    const fullHash = `${hash}.${expires}`;

    const from = "Vonage APIs";
    const to = req.body.phone;
    const text = `Dear Customer, your OTP is ${otp}. It will expire in 3 minutes`;

    async function sendSMS() {
      await vonage.sms
        .send({ to, from, text })
        .then((resp) => {
          console.log("Message sent successfully");
          // console.log(resp);
        })
        .catch((err) => {
          console.log("There was an error sending the messages.");
          //   console.error(err);
        });
    }

    sendSMS();
    return res.status(200).send({
      message: "Success",
      data: fullHash,
    });
  } catch (error) {
    return res.status(500).send({
      message: "Error",
      error: error.message,
    });
  }
};

const verifyOTP = async (req, res) => {
  let [hashValue, expires] = req.body.hash.split(".");

  let now = Date.now();
  if (now > parseInt(expires))
    return res.status(400).send({ message: "OTP Expired" });

  let data = `${req.body.phone}.${req.body.otp}.${expires}`;

  let newCalculatedHash = crypto
    .createHmac("sha256", process.env.Crypto_Key)
    .update(data)
    .digest("hex");

  if (newCalculatedHash === hashValue) {
    return res.status(200).send({ message: "Success" });
  }
  return res.status(400).send({ message: "Invalid OTP" });
};

module.exports = {
  sendOTP,
  verifyOTP,
};
