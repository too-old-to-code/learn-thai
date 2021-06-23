import "./App.css";
import { Elements } from "@stripe/react-stripe-js";
import { loadStripe } from "@stripe/stripe-js";
import { PaymentForm } from "./PaymentForm";
const stripePromise = loadStripe(
  "pk_test_51IqNRkLO2AWV5vsOLmBBMvPufWwkRg00k07sfus3IKEjWEEFFt0ji5HBnFP2KsgDw7P2nXp1Ty4yfdRNpjaQjB0400n0gOaTCS"
);
function App() {
  // const handleSignUp = () => {
  //   console.log("Signed up");
  // };
  return (
    <div className="App">
      <header className="App-header">
        <Elements stripe={stripePromise}>
          <PaymentForm />
          {/* <form>
            <div style={{ width: "400px", background: "white" }}>
              <CardElement
                options={{
                  style: {
                    base: {
                      fontSize: "16px",
                      color: "#424770",
                      "::placeholder": {
                        color: "#aab7c4",
                      },
                    },
                    invalid: {
                      color: "#9e2146",
                    },
                  },
                }}
              />
            </div>
            <button onClick={handleSignUp}>Sign up</button>
          </form> */}
        </Elements>
      </header>
    </div>
  );
}

export default App;
