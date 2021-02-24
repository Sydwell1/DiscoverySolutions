window.addEventListener('load', () => {

    $.ajax({
        url: '/data',
        type: 'POST',
        contentType: "application/json",
        data: JSON.stringify({link: "linkID"}),
        
        success: function (results) {

            let map, heatmap;
            initMap()

            function initMap() {

                map = new google.maps.Map(document.getElementById("map"), {
                    zoom: 3,
                    center: { lat: 0.36313, lng: 23.02014},
                    
                    mapTypeId: "satellite",
                  
                });

                heatmap = new google.maps.visualization.HeatmapLayer({
                    data: getPoints(),
                    map: map,
                });

                heatmap.set("radius", heatmap.get("radius") ? null : 20);
                heatmap.set("opacity", heatmap.get("opacity") ? null : 1);
            }

            // Heatmap data points
            function getPoints() {

                var coordList = [];
            
                results.forEach(data => {
                    // var point = new google.maps.LatLng( data.lat, data.lon );
                    var point = {location: new google.maps.LatLng(data.lat, data.lon), weight: 3}
                    coordList.push(point);
                })
                
                return coordList;
              }        
        }
    })

})




