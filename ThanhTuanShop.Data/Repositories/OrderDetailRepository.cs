using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ThanhTuanShop.Data.Infrastructure;
using ThanhTuanShop.Model.Models;

namespace ThanhTuanShop.Data.Repositories
{
    public interface IOrderDetail
    {

    }
    class OrderDetailRepository : RepositoryBase<OrderDetail>,IOrderDetail
    {
        public OrderDetailRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}
