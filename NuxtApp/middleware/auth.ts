export default defineNuxtRouteMiddleware((to, from) => {

    // อ่าน token จาก cookie
    const token = useCookie('token')

    // ถ้าไม่มี token ให้ redirect ไปหน้า login
    if(!token.value){
        return navigateTo('/')
    }

})
