function cycling_index(){
  var app = new Vue({
    el: '#cycling_index',
    data: {
      message: 'Hello Vue!',
      passes:[],
      disable_send: false,
    },
    methods:{
      //位置情報をサーバ送信する　
      send_location(){
        this.disable_send = true
        navigator.geolocation.getCurrentPosition((position)=>{
          $.post("/coords", {coords:position.coords}).then(data=>{
            console.log(position)
            this.show_passes()
          }, error=>{
            alert("位置情報保存エラー")
          })
          this.disable_send = false
        }, (error)=>{
          alert("位置情報の取得エラー")
          this.disable_send = false
        })
      },
      show_passes(){
        $.get("/passes").then(data=>{
          this.passes = data.passes
        },error=>{
          console.log(error)
        })
      }
    }
  })
}
