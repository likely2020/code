//�ֲ���
function moveStart(obj,width){
    //��ʱ��
    var timer=null;
    var target=0;
    var iNow=0;
    var iNow2=0;
    //С�ڵ�
    var oOl=obj.getElementsByTagName('ol')[0];//ul
    var olLi=oOl.getElementsByTagName('li');//li ����
    olLi[0].className='banner_active';
    //
    var oUl=obj.getElementsByTagName('ul')[0];//ul
    var ulLi=oUl.getElementsByTagName('li');//li ����
    var imgCount=ulLi.length;//�ֲ�ͼƬ����
    var imgWidth=width;//����ͼƬ�Ŀ��
    oUl.style.width=imgWidth*imgCount+'px';//ul�Ŀ��=����li�Ŀ��*li������*2
    //�������
    for(var i=0;i<ulLi.length;i++){
        ulLi[i].index=i;
    }
    for(var i=0;i<olLi.length;i++){
        olLi[i].index=i;
        olLi[i].onmouseover=function(){
            clearInterval(timer);
            for(var j=0;j<olLi.length;j++){
                olLi[j].className='';
            }
            this.className='banner_active';
            target=-this.index*imgWidth;
            startMove(oUl,{left:target});
            iNow=this.index;
            iNow2=this.index;
        }
        olLi[i].onmouseout=function(){
            timer=setInterval(toRun,5000);
        }
    }

    //�Զ��ֲ�
    timer=setInterval(toRun,5000);

    function toRun(){
        if(iNow>=(imgCount-1)){
            ulLi[0].style.position='relative';
            ulLi[0].style.left=imgCount*imgWidth+'px';
            iNow=0;
        }
        else{
            iNow++;
        }
        iNow2++;
        if(iNow2>imgCount){
            iNow2=imgCount;
            iNow=0;
        }
        for(var i=0;i<olLi.length;i++){
            olLi[i].className='';
        }
        olLi[iNow].className='banner_active';
        target=-iNow2*imgWidth;
        startMove(oUl,{left:target},function(){
            if(iNow<=0){
                ulLi[0].style.position='static';
                oUl.style.left=0;
                iNow2=0;
            }
        });
    }

    function startMove(obj, json, fn) {
        clearInterval(obj.iTimer);
        var iCur = 0;
        var iSpeed = 0;

        obj.iTimer = setInterval(function() {
            var iBtn = true;
            for ( var attr in json ) {
                var iTarget = json[attr];
                if (attr == 'opacity') {
                    iCur = Math.round(css( obj, 'opacity' ) * 100);
                } else {
                    iCur = parseInt(css(obj, attr));
                }
                iSpeed = ( iTarget - iCur ) / 8;
                iSpeed = iSpeed > 0 ? Math.ceil(iSpeed) : Math.floor(iSpeed);
                if (iCur != iTarget) {
                    iBtn = false;
                    if (attr == 'opacity') {
                        obj.style.opacity = (iCur + iSpeed) / 100;
                        obj.style.filter = 'alpha(opacity='+ (iCur + iSpeed) +')';
                    } else {
                        obj.style[attr] = iCur + iSpeed + 'px';
                    }
                }
            }
            if (iBtn) {
                clearInterval(obj.iTimer);
                fn && fn.call(obj);
            }
        }, 20);
    }
    function css(obj, attr) {
        if (obj.currentStyle) {
            return obj.currentStyle[attr];
        } else {
            return getComputedStyle(obj, false)[attr];
        }
    }
}