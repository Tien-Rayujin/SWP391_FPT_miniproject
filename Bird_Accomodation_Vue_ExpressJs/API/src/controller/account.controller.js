const accountModel = require("../models/account.model");

module.exports = {

    getAllAccount: async (req, res, next) => {
        try {
            const result = await accountModel.getAllAccount();
            const accountList = result.map(item => ({
                user_id: item.user_id,
                email: item.email,
                name: item.name,
                address: item.address,
                phone: item.phone,
                role: item.role,
                status: item.status,
                user_img: item.user_img,
                token: item.token,
            }))
            res.status(200).send({
                exitcode: 0,
                message: "Get account list successfully",
                accounts: accountList
            })
        } catch (error) {
            console.log(error.message);
            res.status(500).send("Internal server error");
        }
    },
    getAccountByID: async (req, res, next) => {
        try {
            const { user_id } = req.params;
            const result = await accountModel.getAccountByID(user_id);
            if (result.length === 0) {
                console.error("Account not found ");
                res.status(400).send("Account not found");
            } else {
                res.status(200).send({
                    exitcode: 0,
                    message: "Get account detail successfully",
                    account: result
                })
            }
        } catch (error) {
           console.log(error.message);
           res.status(500).send("Internal server error");
        }
    },
    getSearchAccount: async (req, res, next) => {
        try {
            const { name, email, phone } = req.body;
            const searchInfo = {
                name: name,
                email: email,
                phone: phone
            }
            if(!name && !email && !phone){
                console.error("Missing search info");
                res.status(400).send("Missing search info");
            }
            const result = await accountModel.getSearchAccount(searchInfo);
            //[user_id],[email],[name],[address],[phone],[role],[status],[user_img],[token]
            const accountList = result.map(item => ({
                user_id: item.user_id,
                email: item.email,
                name: item.username,
                address: item.address,
                phone: item.phone,
                role: item.role,
                status: item.status,
                user_img: item.user_img,
                token: item.token,
            }))
            if (result.length === 0) {
                console.error("Account not found ");
                res.status(400).send("Account not found");
            } else {
                res.status(200).send({
                    exitcode: 0,
                    message: "Get account detail successfully",
                    accounts: accountList
                })
            }
        } catch (error) {
           console.log(error.message);
           res.status(500).send("Internal server error");
        }
    },
    changeAccountStatus: async (req, res, next) => {
        try {
            const { user_id } = req.params;
            const { currentStatus } = req.body;
            if (currentStatus === undefined || currentStatus === null) {
                console.error("Missing current status ");
                res.status(400).send("Missing current status");
            }
            let newStatus;
            currentStatus === 0 ? newStatus = 1 : newStatus = 0;
            const result = await accountModel.changeAccountStatus(user_id, newStatus);
            if (result === 0) {
                console.error("Account not found ");
                res.status(400).send("Account not found");
            } else {
                const message = newStatus === 1 ? "Unblock account successfully" : "Block account successfully";
                res.status(200).send({
                    exitcode: 0,
                    message: message,
                })
            }
        } catch (error) {
           console.log(error.message);
           res.status(500).send("Internal server error");
        }
    },
    updateUserName: async (req, res, next) => {
        try {
            const { user_id } = req.params;
            const { name } = req.body;
            const result = await accountModel.updateUserName(user_id, name);
            if (result > 0){
                res.status(200).send({
                    exitcode: 0,
                    message: "Update user name successfully"
                })
            } else {
                res.status(200).send({
                    exitcode: 101,
                    message: "Update user name failed"
                })
            }
        } catch (error) {
           console.log(error.message);
            res.status(500).send("Internal server error");
        }
    }
}