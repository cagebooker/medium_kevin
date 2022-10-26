import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
  static targets = [ "clapCount" ]


  addClap(event){
    event.preventDefault()
    // console.log(event.currentTarget)
    let slug = event.currentTarget.dataset.slug

    // /stories/:story_id/clap
    axios.post(`/api/stories/${slug}/clap`)
        .then(res=>{
            let status = res.data.status
            let target = this.clapCountTarget
            switch(status){
                case 'sign_in_first':
                    alert('你必須先登入')
                    break
                default:
                    target.innerHTML = status
            }
            // console.log(res)
        })
        .catch()
    // console.log('go')
  }
}