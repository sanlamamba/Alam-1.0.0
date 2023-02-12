import React, { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import {
  calculateCartTotal,
  calculateCartTotalMinus,
} from "@/utils/calculateCartTotal";
import CheckoutList from "./CheckoutList";
import PlaceOrderBtn from "./PlaceOrderBtn";
import Link from "next/link";
import { motion, AnimatePresence } from "framer-motion";
import Button from "@/utils/Button";
import baseUrl from "@/utils/baseUrl";
import axios from "axios";
import { useRouter } from "next/router";
import { toast } from "react-hot-toast";

const CheckoutForm = ({ user }) => {
  const cartItems = useSelector((state) => state.cart.cartItems);
  const dispatch = useDispatch();
  const [cartAmout, setCartAmaount] = React.useState(0);
  const [cartAmoutMinus, setCartAmaountMinus] = React.useState(0);
  const router = useRouter();

  const [loading, setLoading] = React.useState(false);

  useEffect(() => {
    const { cartTotal } = calculateCartTotal(cartItems);
    const { cartTotalMinus } = calculateCartTotalMinus(cartItems);
    setCartAmaount(cartTotal);
    setCartAmaountMinus(cartTotalMinus);
  }, [cartItems]);

  const handleCheckout = async () => {
    setLoading(true);
    try {
      const payload = {
        cartItems,
        userId: user.id,
        buyer_name: user.first_name,
        buyer_email: user.email,
        buyer_avatar: user.profile_photo,
      };
      const url = `${baseUrl}/api/checkout`;
      const response = await axios.post(url, payload);
      console.log(response);
      toast.success(response.data.message, {
        style: {
          border: "1px solid #4BB543",
          padding: "16px",
          color: "#4BB543",
        },
        iconTheme: {
          primary: "#4BB543",
          secondary: "#FFFAEE",
        },
      });
      dispatch({
        type: "RESET_CART",
      });
      setLoading(false);
      router.push("/learning/my-courses");
    } catch (err) {
      console.log(err);

      toast.error(err, {
        style: {
          border: "1px solid #ff0033",
          padding: "16px",
          color: "#ff0033",
        },
        iconTheme: {
          primary: "#ff0033",
          secondary: "#FFFAEE",
        },
      });
    }
  };
  const handleRemove = async (cartId) => {
    // console.log(cartId);
    dispatch({
      type: "REMOVE_CART",
      id: cartId,
    });
  };

  return (
    <div className="cart-area ptb-100">
      <div className="container">
        <p className="your-cart">
          <span>{cartItems.length}</span> cours dans votre panier
        </p>
        <div className="row justify-content-center">
          <div className="col-lg-8">
            <div className="cart-content">
              <ul className="single-cart">
                {cartItems.length > 0 ? (
                  <AnimatePresence>
                    {cartItems.map((cart) => (
                      <CheckoutList
                        key={cart.id}
                        {...cart}
                        onRemove={() => handleRemove(cart.id)}
                      />
                    ))}
                  </AnimatePresence>
                ) : (
                  <>
                    <motion.div
                      className="col-lg-12 text-center"
                      initial={{ scale: 0 }}
                      animate={{ scale: 1 }}
                      transition={{ duration: 1 }}
                    >
                      <h3
                        style={{
                          textAlign: "center",
                          fontWeight: "bold",
                          color: "#0000001f",
                          fontSize: "93px",
                        }}
                      >
                        Vide
                      </h3>
                      <Link href="/courses">
                        <a className="default-btn">Continuez votre shopping</a>
                      </Link>
                    </motion.div>
                  </>
                )}
              </ul>
            </div>
          </div>

          {cartItems.length > 0 && (
            <div className="col-lg-4">
              <div className="cart-total">
                <h3>
                  Total <span>{cartAmout} Fcfa</span>
                </h3>
                <ul>
                  {cartAmoutMinus > 0 && (
                    <li>
                      <del>{cartAmoutMinus} Fcfa</del>
                    </li>
                  )}
                </ul>
                <button className="btn btn-primary" onClick={handleCheckout}>
                  Commander
                </button>

                {/* <Button
                  loading={loading}
                  disabled={cartItems.length < 1}
                  btnText="Commander"
                  btnClass="default-btn"
                  onClick={handleCheckout}
                />
                <PlaceOrderBtn user={user} cartItems={cartItems} /> */}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default CheckoutForm;
