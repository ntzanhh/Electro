using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ElectroMVC.Data;
using ElectroMVC.Models;
using Microsoft.AspNetCore.Http;
using System.IO;

namespace ElectroMVC.Controllers
{
    public class ProductsController : Controller
    {
        private readonly ElectroMVCContext _context;

        public ProductsController(ElectroMVCContext context)
        {
            _context = context;
        }

        // GET: Products
        public async Task<IActionResult> Index()
        {
            var electroMVCContext = _context.Product.Include(p => p.Brand).Include(p => p.Category);
            return View(await electroMVCContext.ToListAsync());
        }

		public async Task<IActionResult> ProductByCategory(int catId)
		{
			var electroMVCContext = _context.Product.Include(p => p.Brand).Include(p => p.Category).Where(p=>p.CategoryId == catId);
			return View(await electroMVCContext.ToListAsync());
		}

		public async Task<IActionResult> ProductDetails(int? id)
		{
			if (id == null)
			{
				return NotFound();
			}

			var product = await _context.Product
				.Include(p => p.Brand)
				.Include(p => p.Category)
				.FirstOrDefaultAsync(m => m.ProductId == id);
			if (product == null)
			{
				return NotFound();
			}

			return View(product);
		}

		// GET: Products/Details/5
		public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Product
                .Include(p => p.Brand)
                .Include(p => p.Category)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // GET: Products/Create
        public IActionResult Create()
        {
            ViewData["BrandId"] = new SelectList(_context.Brand, "BrandId", "BrandDescription");
            ViewData["CategoryId"] = new SelectList(_context.Category, "CategoryId", "CategoryDescription");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProductId,ProductName,ProductPrice,ProductDescription,ProductQuantity,CategoryId,BrandId")] Product product, IFormFile productImage)
        {
            if (ModelState.IsValid)
            {
                if (productImage != null && productImage.Length > 0)
                {
                    var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/uploads/products");
                    if (!Directory.Exists(uploadsFolder))
                    {
                        Directory.CreateDirectory(uploadsFolder);
                    }

                    var fileName = Guid.NewGuid() + Path.GetExtension(productImage.FileName);
                    var filePath = Path.Combine(uploadsFolder, fileName);
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await productImage.CopyToAsync(stream);
                    }

                    product.ProductImage = "/uploads/products/" + fileName; // Đường dẫn ảnh
                }

                _context.Add(product);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            ViewData["BrandId"] = new SelectList(_context.Brand, "BrandId", "BrandDescription", product.BrandId);
            ViewData["CategoryId"] = new SelectList(_context.Category, "CategoryId", "CategoryDescription", product.CategoryId);
            return View(product);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProductId,ProductName,ProductPrice,ProductDescription,ProductQuantity,CategoryId,BrandId")] Product product, IFormFile productImage)
        {
            if (id != product.ProductId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (productImage != null && productImage.Length > 0)
                    {
                        var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/uploads/products");
                        if (!Directory.Exists(uploadsFolder))
                        {
                            Directory.CreateDirectory(uploadsFolder);
                        }

                        var fileName = Guid.NewGuid() + Path.GetExtension(productImage.FileName);
                        var filePath = Path.Combine(uploadsFolder, fileName);
                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            await productImage.CopyToAsync(stream);
                        }

                        product.ProductImage = "/uploads/products/" + fileName; // Cập nhật đường dẫn ảnh
                    }

                    _context.Update(product);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.ProductId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }

            ViewData["BrandId"] = new SelectList(_context.Brand, "BrandId", "BrandDescription", product.BrandId);
            ViewData["CategoryId"] = new SelectList(_context.Category, "CategoryId", "CategoryDescription", product.CategoryId);
            return View(product);
        }

        // GET: Products/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Product.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            ViewData["BrandId"] = new SelectList(_context.Brand, "BrandId", "BrandDescription", product.BrandId);
            ViewData["CategoryId"] = new SelectList(_context.Category, "CategoryId", "CategoryDescription", product.CategoryId);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProductId,ProductName,ProductPrice,ProductDescription,ProductQuantity,ProductImage,CategoryId,BrandId")] Product product)
        {
            if (id != product.ProductId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(product);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.ProductId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["BrandId"] = new SelectList(_context.Brand, "BrandId", "BrandDescription", product.BrandId);
            ViewData["CategoryId"] = new SelectList(_context.Category, "CategoryId", "CategoryDescription", product.CategoryId);
            return View(product);
        }

        // GET: Products/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Product
                .Include(p => p.Brand)
                .Include(p => p.Category)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var product = await _context.Product.FindAsync(id);
            if (product != null)
            {
                _context.Product.Remove(product);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProductExists(int id)
        {
            return _context.Product.Any(e => e.ProductId == id);
        }

		// Tìm kiếm sản phẩm theo tên
		[HttpGet]
		public async Task<IActionResult> Search(string searchTerm)
		{
			// Nếu không có từ khóa tìm kiếm, trả về danh sách sản phẩm rỗng
			if (string.IsNullOrEmpty(searchTerm))
			{
				return View(new List<Product>());
			}

			// Tìm kiếm sản phẩm theo tên (ProductName)
			var products = await _context.Product
				.Include(p => p.Brand)
				.Include(p => p.Category)
				.Where(p => p.ProductName.Contains(searchTerm)) // Điều kiện tìm kiếm
				.ToListAsync();

			// Trả về view với danh sách sản phẩm tìm thấy
			return View(products);
		}


	}
}
