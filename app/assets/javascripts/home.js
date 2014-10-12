      window.onload = function() {
        try {
          TagCanvas.Start('myCanvas','tags',{
            textColour: '#000000',
            outlineColour: '#0000ff',
            reverse: true,
            depth: 0.75,
            maxSpeed: 0.10,
            weight: true
          });
        } catch(e) {
          // something went wrong, hide the canvas container
          document.getElementById('myCanvasContainer').style.display = 'none';
        }
      };



