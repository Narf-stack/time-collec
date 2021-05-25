const newFriend =()=> {
    const newFriendElem = document.getElementById('div-new-friend')
    
    if (newFriendElem){
        const newBtn = document.getElementById('new-friend')

        newBtn.addEventListener("click", (e) => {

            const shopSlug = newFriendElem.dataset.slug
            // console.log(JSON.parse(shopSlug))
            // const url = `/shops/${shopSlug}/friends/new`
            // const AUTH_TOKEN = $('meta[name=csrf-token]').attr('content');
            // // post body data 
            // const data = {shop_slug:shopSlug} 

                
            // // request options
            // const options = {
            //     method: 'POST',
            //     body: JSON.stringify(data),
            //     data: data,
            //     headers: {
            //         'Content-Type': 'application/json',
            //         "Accept": "application/json",
            //         'X-CSRF-Token': AUTH_TOKEN
            //     }
            // }


            const url = `/new_contact?shop_slug=${shopSlug}&type=friends`
            const AUTH_TOKEN = $('meta[name=csrf-token]').attr('content');
            // post body data 
            const data = {shop_slug:shopSlug, type:'friends'} 

                
            // request options
            const options = {
                method: 'POST',
                dataType : 'script',
                // body: JSON.stringify(data),
                // data: data,
                headers: {
                    // 'Content-Type': 'application/json',
                    // "Accept": "application/json",
                    'X-CSRF-Token': AUTH_TOKEN
                },
                success: function(){
                    // console.log(JSON.stringify(data));
                    console.log('hey')
                },
                error: function(){
                    alert("Error");
                }
            }
            fetch(url, options);

            
            // Rails.ajax({
            //     type: "post",
            //     url: `shop_friends`,
            //     data: data,
            //     headers: {
            //         accept: '*/*',
            //         'X-CSRF-Token': Rails.csrfToken()
            //       },
            //   })
        })
    }
}

export  { newFriend };