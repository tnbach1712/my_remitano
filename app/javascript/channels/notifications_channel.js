import consumer from "./consumer"

consumer.subscriptions.create("ShareVideoNotificationsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected................................................................")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("disconnected................................................................")
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    alert(`New notification: ${data.message}`);
    // You can replace this with any code to update your UI
  }
});