﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ThanhTuanShop.Data.Infrastructure;
using ThanhTuanShop.Model.Models;

namespace ThanhTuanShop.Data.Repositories
{
    public interface IPostCategoryRepository
    {

    }
    public class PostCategoryRepository : RepositoryBase<PostCategory>,IPostCategoryRepository
    {
        public PostCategoryRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}