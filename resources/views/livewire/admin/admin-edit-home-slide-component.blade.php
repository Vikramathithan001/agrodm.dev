<div>
    <style>
        nav svg{
            height: 20px;
        }
        nav .hidden{
            display: block;
        }
    </style>
    <main class="main">
        <div class="page-header breadcrumb-wrap">
            <div class="container">
                <div class="breadcrumb">
                    <a href="/" rel="nofollow">Home</a>
                    <span></span> Edit Slide
                </div>
            </div>
        </div>
        <section class="mt-50 mb-50">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="cart-header">
                                <div class="col-md-6">
                                  Edit Slide
                                </div>
                                <div class="col-md-11">
                                    <a href="{{route('admin.home.slider')}}" class="btn btn-success float-end">All slides</a>
                                </div>
                        </div>
                            <div class="card-body">
                                @if(Session::has('message'))
                                <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                                @endif
                               <form wire:submit.prevent="updateSlide">
                                <div class="md-3 mt-3">
                                    <label for="name" class="form-label">Top Title</label>
                                    <input type="text" class="form-control" placeholder="Enter slide toptitle" wire:model="top_title" />
                                    @error('top_title')
                                    <p class="text-danger">{{$message}}</p>
                                    @enderror
                                </div>
                                <div class="md-3 mt-3">
                                    <label  class="form-label">Title</label>
                                    <input type="text"  class="form-control" placeholder="Enter slide title" wire:model="title">
                                    @error('title')
                                    <p class="text-danger">{{$message}}</p>
                                    @enderror
                                </div>
                                <div class="md-3 mt-3">
                                    <label  class="form-label">Sub Title</label>
                                    <input type="text"  class="form-control" placeholder="Enter slide Subtitle" wire:model="sub_title">
                                    @error('sub_title')
                                    <p class="text-danger">{{$message}}</p>
                                    @enderror
                                </div><div class="md-3 mt-3">
                                    <label  class="form-label">Offer</label>
                                    <input type="text"  class="form-control" placeholder="Enter  offer" wire:model="offer">
                                    @error('offer')
                                    <p class="text-danger">{{$message}}</p>
                                    @enderror
                                </div><div class="md-3 mt-3">
                                    <label  class="form-label">Link</label>
                                    <input type="text"  class="form-control" placeholder="Enter  link" wire:model="link">
                                    @error('link')
                                    <p class="text-danger">{{$message}}</p>
                                    @enderror
                                </div><div class="md-3 mt-3">
                                    <label  class="form-label">Status</label>
                                    <select name="form-select" wire:model="status" >
                                        <option value="1">Active</option>
                                        <option value="0">InActive</option>
                                    </select>
                                    @error('status')
                                    <p class="text-danger">{{$message}}</p>
                                    @enderror
                                </div>
                                </div><div class="md-3 mt-3">
                                    <label  class="form-label">Image</label>
                                    <input type="file" class="form-control" wire:model="newimage">
                                    @if($newimage)
                                    <img src="{{$newimage->temporaryUrl()}}" alt="" width="100">
                                    else
                                    <img src="{{asset('assets/imgs/slider')}}/{{$image}}" alt="" width="100">
                                    @endif
                                    @error('image')
                                    <p class="text-danger">{{$message}}</p>
                                    @enderror
                                </div>
                                <div class="col-md-12">
                                <button type="submit" class="btn btn-primary float-end">Update</button>
                                </div>
                               </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>
