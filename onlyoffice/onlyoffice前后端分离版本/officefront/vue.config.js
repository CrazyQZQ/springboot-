// 配置代理
module.exports = {
    devServer: {
        proxy: {
            '/office': {
                target: 'localhost:8080',
                ws: true,
                changeOrigin: true,
                pathRewrite: {}
            }
        }
    }
}