using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ThanhTuanShop.Data.Infrastructure;
using ThanhTuanShop.Model.Models;

namespace ThanhTuanShop.Data.Repositories
{
    public interface IOrderRepository
    {

    }
    public class OrderRepository : RepositoryBase<Order>,IOrderRepository
    {
        public OrderRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}
