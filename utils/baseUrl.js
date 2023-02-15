const baseUrl =
  process.env.NODE_ENV === "production"
    ? "https://alam-beta.vercel.app/"
    : "http://localhost:3000";

export default baseUrl;
