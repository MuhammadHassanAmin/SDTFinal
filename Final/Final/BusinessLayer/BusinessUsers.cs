using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.BusinessLayer
{
    public class BusinessUsers
    {
        public BusinessUsers() { }
        public string addUser(user pU)
        {
            SDT_FinalEntities context = new SDT_FinalEntities();
            var user = context.users
                    .Where(u => u.name == pU.name.ToLower() && u.email == pU.email.ToLower())
                    .FirstOrDefault();
            if (user != null)
            {
                return "userNameOrEmailAlreadyExsist";
            }
            else if (! IsValidEmail(pU.email))
            {
                return "invalidemail";

            }
            context.users.Add(pU);
            context.SaveChanges();
            return "useradded";
        }
        public bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }
        public user login(user pU)
        {
            SDT_FinalEntities context = new SDT_FinalEntities();
            var user = context.users
                    .Where(u => u.email.Trim().ToLower() == pU.email.ToLower() && u.password.Trim() == pU.password && u.type.Trim() == pU.type)
                    .FirstOrDefault();
            return user;
        }

    }

}