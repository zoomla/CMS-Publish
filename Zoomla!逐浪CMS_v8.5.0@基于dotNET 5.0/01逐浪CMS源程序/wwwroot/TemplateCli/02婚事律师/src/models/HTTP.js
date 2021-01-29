import axios from "axios"
// 如果需要跨越使用 import axios from 'axios-jsonp-pro'
axios.defaults.baseURL = 'https://www.easy-mock.com/mock/5bf3c7b551173f3d71de3a58/vue';
class HTTP {
    request({
        url,
        method = "GET",
        data = {},
        params = {}
    }) {
        return axios({
            method,
            url,
            data,
            params
        });
    }
}
export {
    HTTP
}