import axios from 'axios'

const api = axios.create({
    baseURL: 'http://localhost:5000',
    timeout: 10000,
})

api.interceptors.request.use((config) => {
    const token = localStorage.getItem('token');
    if (token) {
        config.headers = {
            'Content-Type': 'application/json',
            'x-access-token': token
        }
    }
    return config;
});

export default api