<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Cart;
use Illuminate\Support\Facades\Auth;


class CartIconComponent extends Component
{
    protected $listeners =['refreshComponent'=>'$refresh'];
    public function checkout()
    {
        if(Auth::check())
        {
            return redirect()->route('shop.checkout');
        }
        else
        {
            return redirect()->route('login');
        }
    }
    public function setAmountForCheckOut()
    {
        if(!Cart::instance('cart')->count() > 0)
        {
            session()->forget('checkout');
            return;
        }
        session()->put('checkout',[
            'discount'=>0,
            'subtotal' =>Cart::instance('cart')->subtotal(),
            'tax'=>Cart::instance('cart')->tax(),
            'total'=>Cart::instance('cart')->total()
        ]);
    }
    public function render()
    {
        $this->setAmountForCheckOut();
        return view('livewire.cart-icon-component');
    }
}
