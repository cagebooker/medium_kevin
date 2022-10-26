import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
  static targets = [ "followBtn","bookmark" ];

  followUp(event){
    let user = this.followBtnTarget.dataset.user;
    event.preventDefault ();
    // console.log("hello");
    axios.post(`/api/users/${user}/follow`)
        .then( res => {
            let status = res.data.status
            switch (status){
              case 'sign_in_first':
                alert('請先登入！')
                break
              default:
                this.followBtnTarget.innerHTML = status
            }
        }).catch( err => {
            console.log(err)
        })
  };

  bookmark(evt){
    evt.preventDefault()
    // console.log(evt.currentTarget.dataset.slug)
    let icon = this.bookmarkTarget
    // console.log(this.bookmarkTarget)
    let story_id = evt.currentTarget.dataset.slug

    axios.post(`/api/stories/${story_id}/bookmark`)
        .then( res => {
          switch (res.data.status){
            case 'Bookmarked':
              icon.classList.remove('fa-regular')
              icon.classList.add('fa-solid')
              break
            case 'UnBookmarked':
              icon.classList.add('fa-regular')
              icon.classList.remove('fa-solid')
              break
          }
          console.log(res.data)
        }).catch( err=>{
          console.log(err)
        })
  }
}