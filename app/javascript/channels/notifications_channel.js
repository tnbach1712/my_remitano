import consumer from "./consumer"
import Notiflix from 'notiflix';
import { getCookies } from '../components/index'
if(getCookies("user_id") !== undefined && getCookies("user_id") !== '' ){
  consumer.subscriptions.create("ShareVideoNotificationsChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
      console.log("disconnected");
    },
  
    received(data) {
      // Called when there's incoming data on the websocket for this channel
      let userID = getCookies("user_id")
      if (userID != data.metadata.user_id ) {
        Notiflix.Notify.success(`
            <a href="/share_videos/${data.metadata.id}" target="_blank" class="font-mono font-black text-sm my-4"> ${data.metadata.title} </a>
            <br/>
            <p> ${data.metadata.description.slice(0,300)}..</p>
          `, {
          width: "500px",
          height: "500px",
          messageMaxLength: 1000,
          plainText: false
        });
      }
    }
  });
}

