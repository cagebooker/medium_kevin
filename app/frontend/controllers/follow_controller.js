import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
  static targets = [ "followBtn" ]
  //
  followUp(event){
    let user = this.followBtnTarget.dataset.user;
    event.preventDefault ()
    // console.log("hello");
    axios.post(`/users/${user}/follow`)
        .then( res => {
            let status = res.data.status
            switch (status){
              case 'sign_in_first':
                alert('請先登入！')
                break
              default:
                this.followBtnTarget.innerHTML = status
            }
        }).catch(err=>{
            console.log(err)
        })
  }



}