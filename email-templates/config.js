import nodemailer from "nodemailer";
const smtpConfig = {
  host: "smtp.ionos.fr",
  port: 465,
  secure: true, // use SSL
  auth: {
    user: "test@nhqlv.fr",
    pass: "@motpass1+",
  },
};

export const transport = nodemailer.createTransport({
  // Yes. SMTP!
  service: "SMTP",
  // The hostname or IP address to connect to
  host: smtpConfig.host,
  // The port to connect to
  port: smtpConfig.port,
  // Connection security
  secure: smtpConfig.secure,
  // Authentication
  auth: {
    user: smtpConfig.auth.user,
    pass: smtpConfig.auth.pass,
  },
});
