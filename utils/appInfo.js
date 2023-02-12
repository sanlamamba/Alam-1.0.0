const name = process.env.APP_NAME || "Alam";
const slogan = "L'education pour tous";

const url = process.env.NODE_ENV ? "alamapp.com" : "localhost:3000";
const phone = process.env.NODE_ENV ? "+221 70 952 93 18" : "+221 XX XXX XX XX";
const email = process.env.NODE_ENV ? `contact@${url}` : "contact@example.com";
const author = {
  name: "San-Lamamba",
  link: "www.sanlamamba.com",
};
const appInfo = {
  name,
  url,
  phone,
  email,
  author,
  slogan,
};

export default appInfo;
