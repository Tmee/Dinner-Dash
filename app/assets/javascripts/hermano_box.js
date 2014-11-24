function Brush(x,y,size,jitt,maxHeight,color,invert) {
  this.x = x;
  this.y = y;
  this.height = 0;
  this.size = size;
  this.jitt = jitt;
  this.maxHeight = maxHeight;
  this.color = color;
  this.invert = invert;
}
Brush.prototype.grow = function() {
  if( this.height ++ > this.maxHeight ) {
    return;
  }
  requestAnimationFrame(this.grow.bind(this));
  var y = this.invert ? this.maxHeight - this.height : this.height;
  context.beginPath();
  context.moveTo(this.x - this.size/2, y);
  context.lineTo(this.x + this.size/2, y);
  context.strokeStyle = this.color;
  context.stroke();
  context.closePath();
  this.x += Math.random() * this.jitt - (this.jitt / 2);
}
function itterate() {
  for( var i = 0; i < 16; i++ ) {
    if( count >= limit ) return;

    var x = Math.random() * width,
    y = height,
    size = Math.random() * 15 + 15,
    jitt = Math.random() + 0.6,
    maxHeight = height;
    new Brush(x,y,size,jitt,maxHeight,color(count++),Math.random()>0.5).grow();
  }
  setTimeout(itterate, Math.random() * 300);
}
function color(i) {
  var r = Math.floor( Math.sin(i) * 127 + 128 );
  var g = Math.floor( Math.sin(i + 2) * 127 + 128 );
  var b = Math.floor( Math.sin(i + 3) * 127 + 128 );
  return 'rgb(' + r + ', ' + g + ',' + b + ')';
}
function init() {
  canvas = document.getElementById('canvas');
  context = canvas.getContext('2d');
  height = canvas.height = document.body.offsetHeight;
  width = canvas.width = document.body.offsetWidth;
  count = 0;
  limit = 1024;
  context.globalAlpha = 0.88;
  itterate();
}
var canvas,context,height,width,count,limit;
setTimeout(init,10);
