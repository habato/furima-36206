document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('item-image')){
    const ImageList = document.getElementById('image-list');

    const createImageHTML = (blob) => {
     const imageElement = document.createElement('div');
     const blobImage = document.createElement('img');
     blobImage.setAttribute('src', blob);
     blobImage.classList.add('image-preview');

     imageElement.appendChild(blobImage);
     ImageList.appendChild(imageElement);
   };

    document.getElementById('item-image').addEventListener('change', function(e){
      const imageContent = ImageList.querySelector('img');
      const originalPreview = document.getElementById('original-preview');
      if (imageContent){
        imageContent.remove();
      }
      if (originalPreview) {
        originalPreview.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  }
});