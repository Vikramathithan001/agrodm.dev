<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\Product;
use Livewire\WithPagination;
class AdminProductComponent extends Component
{
    use WithPagination;
    public $product_id;

public function deleteProduct()
{
    $product = Product::find($this->product_id);
    unlink('assets/imgs/products/'.$product->image);
    $product->delete();
    session()->flash('massage','Product has been deleted');
}
    public function render()
    {
        $products = Product::orderBy('created_at','DESC')->paginate(10);
        return view('livewire.admin.admin-product-component',['products'=>$products]);
    }
}
