const newEmergency =()=> {
    const newEmergencyElem = document.getElementById('div-new-emergency')
    
    if (newEmergencyElem){
        const newBtn = document.getElementById('new-emergency-btn')
        newBtn.addEventListener("click", (e) => {
            const shopSlug = newEmergencyElem.dataset.slug
            const url = `/new_contact?shop_slug=${shopSlug}&type=emergencies`
            const AUTH_TOKEN = $('meta[name=csrf-token]').attr('content');

            // request options
            const options = {
                method: 'POST',
                dataType : 'script',
                headers: {
                    'X-CSRF-Token': AUTH_TOKEN
                },
                success: function(){
                    console.log('emergency go')
                },
                error: function(){
                    alert("Error emergency");
                }
            }
            fetch(url, options);
        })
    }
}
export  { newEmergency };