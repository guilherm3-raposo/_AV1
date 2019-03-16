function fMasc(objeto,mascara) {
    obj=objeto
    masc=mascara
    setTimeout("fMascEx()",1)
}
function fMascEx() {
    obj.value=masc(obj.value)
}
function mTel(tel) {
    tel=tel.replace(/\D/g,"")
    tel=tel.replace(/^(\d)/,"($1")
    tel=tel.replace(/(.{3})(\d)/,"$1)$2")
    if(tel.length == 9) {
        tel=tel.replace(/(.{1})$/,"-$1")
    } else if (tel.length == 10) {
        tel=tel.replace(/(.{2})$/,"-$1")
    } else if (tel.length == 11) {
        tel=tel.replace(/(.{3})$/,"-$1")
    } else if (tel.length == 12) {
        tel=tel.replace(/(.{4})$/,"-$1")
    } else if (tel.length > 12) {
        tel=tel.replace(/(.{4})$/,"-$1")
    }
    return tel;
}
function mCNPJ(cnpj){
    cnpj=cnpj.replace(/\D/g,"")
    cnpj=cnpj.replace(/^(\d{2})(\d)/,"$1.$2")
    cnpj=cnpj.replace(/^(\d{2})\.(\d{3})(\d)/,"$1.$2.$3")
    cnpj=cnpj.replace(/\.(\d{3})(\d)/,".$1/$2")
    cnpj=cnpj.replace(/(\d{4})(\d)/,"$1-$2")
    return cnpj
}
function mCPF(cpf){
    cpf=cpf.replace(/\D/g,"")
    cpf=cpf.replace(/(\d{3})(\d)/,"$1.$2")
    cpf=cpf.replace(/(\d{3})(\d)/,"$1.$2")
    cpf=cpf.replace(/(\d{3})(\d{1,2})$/,"$1-$2")
    return cpf
}
function mCEP(cep){
    cep=cep.replace(/\D/g,"")
    cep=cep.replace(/^(\d{2})(\d)/,"$1.$2")
    cep=cep.replace(/\.(\d{3})(\d)/,".$1-$2")
    return cep
}
function mNum(num){
    num=num.replace(/\D/g,"")
    return num
}

$('.datepicker').datepicker({
    format: 'dd/mm/yyyy',
    startDate: '-3d'
});


function hide(elemento) {
    elemento.classList.add("oculto");
}
function show(elemento) {
    elemento.classList.remove("oculto");
}

class Validator {
    static checkInput(input) {
        console.log(input)
    
        let vazio = document.querySelector("." + input.name + ".vazio")
        if (input.validity.valueMissing) {
            show(vazio);
            console.log("Valor vazio")
        } else {
            hide(vazio);
        }
    
        let tamanho = document.querySelector("." + input.name + ".tamanho")
        if (input.validity.tooShort || input.validity.tooLong) {
            show(tamanho);                  
            console.log("Tamanho Invalido")
        } else {
            hide(tamanho);
        }
        
        console.log(input.value)
        let invalido = document.querySelector("." + input.name + ".invalido")
        if(input.name == "senha" && !/[\da-zA-Z.-_@]+/.test(input.value)) {
        	input.validity.patternMismatch = true;
            show(invalido);                  
            console.log("Valor Invalido")
        } else {
            hide(invalido);
        }
        
    }     
}

function toggleShowPwd() {
	let pwd = document.querySelector("[name='senha']")
	console.log(pwd)
	if(pwd.type == "password") pwd.type = "text"
	else pwd.type = "password"
}

var provas = document.getElementsByClassName("item");
var i;

function mostraProva(id) {
	for (i = 0; i < provas.length; i++) {
		provas[i].classList.add('oculto');
	}
	document.getElementById(id).classList.remove('oculto')
}

function updateImagem(imagem) {
	let imagemPrevia = document.getElementById("imagemPrevia");
	let base64 = document.querySelector("input[name='base64']");
	let leitor = new FileReader();

	leitor.onload = function(imagem) {
		let resultado = imagem.target.result; // <--- base64
		imagemPrevia.src = resultado;
		base64.value = resultado;
	}

	leitor.readAsDataURL(imagem.files[0])

}