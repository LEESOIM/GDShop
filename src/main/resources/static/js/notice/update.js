let total_file_size=0

$(document).ready(function(){
    console.log("시작")
    $.ajax({
        type:"GET",
        url:"start",
        data:{
            noticeNum:parseInt($("#noticeNum").val())
        },
        success:function(data){
            console.log(data)
            for(i=0; i<data.fileVOs.length; i++){
                total_file_size += data.fileVOs[i].size

                byteUnit=setByteUnit(data.fileVOs[i].size).get("unit")
                size=setByteUnit(data.fileVOs[i].size).get("size")
                let li = $('<li class="fileItem" id="'+data.fileVOs[i].fileNum+'"></li>')
                li.append('<div class="remove"><button type="button" data-filenum="'+data.fileVOs[i].fileNum +'"data-filename="'+data.fileVOs[i].fileName+'"data-size="'+data.fileVOs[i].size+'"class="btn remove_button_uploaded"><i class="bi bi-x-circle"></i></button></div>')
                li.append('<div class="fileName">'+data.fileVOs[i].oriName+'</div>')
                li.append('<div class="fileSize">'+size+byteUnit+'</div>')
                $("#fileList").append(li)
            }
            unit = setByteUnit(total_file_size).get("unit")
            total_size = setByteUnit(total_file_size).get("size")
            $("#fileSize").text(total_size+unit)
            plz_drag_check()
        }
    })
})


addFileList();
removeFile();

const dataTransfer = new DataTransfer();
total_file_size=parseInt($("#fileSize").text())
console.log($("#fileSize").text())
//파일 업로드 변경 이벤트
$("#files").change(function(){
    console.log("파일 변경")
   
    let fileArr = document.getElementById("files").files

    console.log("파일변경 fileArr",fileArr)
    if(fileArr != null && fileArr.length>0){
        $('#plz_drag').css("display",'none')
        $('.file_list_header').css('display','flex')
        for(var i=0; i<fileArr.length; i++){
            dataTransfer.items.add(fileArr[i])
        }
        document.getElementById("files").files = dataTransfer.files;

    }
    addFileList(fileArr);  
})
// 파일 리스트 엘리먼트 추가, 용량계산
function addFileList(fileArr){
    if(fileArr != null && fileArr.length>0){
        // 총용량 계산
        for(var i=0; i<fileArr.length; i++){
            let size = fileArr[i].size;
            //console.log("더하기 전",total_file_size)
            total_file_size += size
            //console.log("더하기 후",total_file_size)
            byteUnit=setByteUnit(size).get("unit")
            size=setByteUnit(size).get("size")
    
            let li = $('<li class="fileItem" id="'+fileArr[i].lastModified+'"></li>')
            li.append('<div class="remove"><button type="button" data-index="'+fileArr[i].lastModified +'" class="btn remove_button"><i class="bi bi-x-circle"></i></button></div>')
            li.append('<div class="fileName">'+fileArr[i].name+'</div>')
            li.append('<div class="fileSize">'+size+byteUnit+'</div>')
            $("#fileList").append(li)
        }

        unit = setByteUnit(total_file_size).get("unit")
        total_size = setByteUnit(total_file_size).get("size")
        $("#fileSize").text(total_size+unit)
        plz_drag_check()
    }
}

// 파일 크기 단위
function setByteUnit(size){
    let map = new Map();

    if(4<=size.toString().length && size.toString().length<=6){
        size=(size/1024).toFixed(2)
        byteUnit='KB'
    }else if(7<=size.toString().length && size.toString().length<=9){
        size=(size/1024**2).toFixed(2)
        byteUnit='MB'
    }else if(10<=size.toString().length && size.toString().length<=12){
        size= (size/1024**3).toFixed(2)
        byteUnit='GB'
    }else if(size.toString().length<4){
        byteUnit='byte'
    }

    map.set("size",size);
    map.set("unit",byteUnit);
    
    return map;
}


// 파일 제거(X버튼)
function removeFile(){
    $("#fileList").click(function(event){
        console.log("removeFile")
        console.log($(event.target).parent())
        // 원래 올라갔던 파일 제거 버튼
        if($(event.target).parent().hasClass('remove_button_uploaded')){
            // fileName[], fileNum[] 
            let inputName = '<input type="text" name="fileName" value="'+ $(event.target).parent().attr("data-filename")+'" hidden>'
            let inputNum = '<input type="text" name="fileNum" value="'+ parseInt($(event.target).parent().attr("data-filenum"))+'"hidden>'
            $("#form").append(inputName)
            $("#form").append(inputNum)
            
            const removeTarget = document.getElementById($(event.target).parent().attr("data-filenum"));
            removeTarget.remove();

            total_file_size-=$(event.target).parent().attr("data-size")
            unit = setByteUnit(total_file_size).get("unit")
            total_size = setByteUnit(total_file_size).get("size")
            $("#fileSize").text(total_size+unit)
            plz_drag_check()
        }

        // 추가할 파일 제거 버튼
        if($(event.target).parent().hasClass('remove_button')){
            targetFile = $(event.target).parent().attr("data-index")
            
            for(var i=0; i<dataTransfer.files.length; i++){
                if(dataTransfer.files[i].lastModified==targetFile){
                    // 총용량에서 삭제
                    total_file_size-=dataTransfer.files[i].size
                    
                    dataTransfer.items.remove(i)
                    break
                }
            }
            document.getElementById("files").files = dataTransfer.files;
     
            const removeTarget = document.getElementById(targetFile);
            removeTarget.remove();
            // console.log("dataTransfer 삭제후=>",dataTransfer.files)
            // console.log('input FIles 삭제후=>',document.getElementById("files").files)
            unit = setByteUnit(total_file_size).get("unit")
            total_size = setByteUnit(total_file_size).get("size")
            $("#fileSize").text(total_size+unit)


            plz_drag_check()
        }
    })
}
// 파일 전체 제거
$("#removeAll_button").click(function(){
    console.log("전체 제거",dataTransfer.files.length)
    dataTransfer.items.clear()
    total_file_size=0
    if($(".remove_button_uploaded").length>0){
        console.log($(".remove_button_uploaded"))
        for(i=0; i<$(".remove_button_uploaded").length; i++){
            let inputName = '<input type="text" name="fileName" value="'+ $(".remove_button_uploaded")[i].dataset.filename+'"hidden>'
            let inputNum = '<input type="text" name="fileNum" value="'+ parseInt($(".remove_button_uploaded")[i].dataset.filenum)+'"hidden>'
            $("#form").append(inputName)
            $("#form").append(inputNum)
        }
    }
    $("#fileList").empty();

    document.getElementById("files").files = dataTransfer.files;

    plz_drag_check()
})


// 파일 Drag & Drop
const file_drag = document.getElementById("file_drag")

file_drag.addEventListener("dragover",function(e){
    console.log("드래그 오버")
    $(".file_drag").addClass("dragOver")
    e.preventDefault();
})
file_drag.addEventListener("drop",function(e){
    console.log("드랍")
    $(".file_drag").toggleClass("dragOver")
    e.preventDefault();
    
    arr= e.dataTransfer.files;
    addFileList(arr)
    for(var i=0; i<arr.length; i++){
       dataTransfer.items.add(arr[i])
    }
    plz_drag_check()
    document.getElementById("files").files=dataTransfer.files;
})


function plz_drag_check(){
    if($("#fileList").children().length>0){
        $('#plz_drag').css("display",'none')
        $('.file_list_header').css('display','flex')
      }else{
        $('#plz_drag').css("display",'block')
        $('.file_list_header').css('display','none')
      }
}