function cycling_index(){
  var app = new Vue({
    el: '#cycling_index',
    data: {
      message: 'Hello Vue!',
      positions: [],
      disable_send: false,
    },
    methods:{
      send_location(){
        this.disable_send = true
        navigator.geolocation.getCurrentPosition((position)=>{
          // console.log(position)
          this.positions.unshift(position);
          $.post("/coords", {coords:position.coords}).then(data=>{
            console.log(position)
          }, error=>{
            alert("位置情報保存エラー")
          })
          this.disable_send = false
        }, (error)=>{
          alert("位置情報の取得エラー")
          this.disable_send = false
        })
      },
    }
  })
}
