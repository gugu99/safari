<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<section id="modal-sizes">
    <div class="row">
        <div class="col-12">
            <div class="card">
                
                <div class="card-content collapse show">
                        <div class="row my-2">
                            
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="form-group">

                                    <!-- Modal -->
                                    <div class="modal fade text-left" id="add-schedule" tabindex="-1" role="dialog" aria-labelledby="myModalLabel17" aria-hidden="true">
                                        <div class="modal-dialog modal-lg" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myModalLabel17">일정 작성</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
		                                                <form novalidate>
		                                                    <div class="row">
		                                                        
		                                                        <div class="col-12">
		                                                            <div class="form-group">
		                                                                <div class="controls">
		                                                                    <label for="account-birth-date">Start date</label>
		                                                                    <input type="text" class="form-control birthdate-picker" required placeholder="Birth date" id="account-birth-date" data-validation-required-message="This birthdate field is required">
		                                                                </div>
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-12">
		                                                            <div class="form-group">
		                                                                <div class="controls">
		                                                                    <label for="account-birth-date">End date</label>
		                                                                    <input type="text" class="form-control birthdate-picker" required placeholder="Birth date" id="account-birth-date" data-validation-required-message="This birthdate field is required">
		                                                                </div>
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-12">
		                                                            <div class="form-group">
		                                                                <label for="accountSelect">Country</label>
		                                                                <select class="form-control" id="accountSelect">
		                                                                    <option>USA</option>
		                                                                    <option>India</option>
		                                                                    <option>Canada</option>
		                                                                </select>
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-12">
		                                                            <div class="form-group">
		                                                                <label for="languageselect2">Languages</label>
		                                                                <select class="form-control" id="languageselect2" multiple="multiple">
		                                                                    <option value="English" selected>English</option>
		                                                                    <option value="Spanish">Spanish</option>
		                                                                    <option value="French">French</option>
		                                                                    <option value="Russian">Russian</option>
		                                                                    <option value="German">German</option>
		                                                                    <option value="Arabic" selected>Arabic</option>
		                                                                    <option value="Sanskrit">Sanskrit</option>
		                                                                </select>
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-12">
		                                                            <div class="form-group">
		                                                                <div class="controls">
		                                                                    <label for="account-phone">Phone</label>
		                                                                    <input type="text" class="form-control" id="account-phone" required placeholder="Phone number" value="(+656) 254 2568" data-validation-required-message="This phone number field is required">
		                                                                </div>
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-12">
		                                                            <div class="form-group">
		                                                                <label for="account-website">Website</label>
		                                                                <input type="text" class="form-control" id="account-website" placeholder="Website address">
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-12">
		                                                            <div class="form-group">
		                                                                <label for="musicselect2">Favourite Music</label>
		                                                                <select class="form-control" id="musicselect2" multiple="multiple">
		                                                                    <option value="Rock">Rock</option>
		                                                                    <option value="Jazz" selected>Jazz</option>
		                                                                    <option value="Disco">Disco</option>
		                                                                    <option value="Pop">Pop</option>
		                                                                    <option value="Techno">Techno</option>
		                                                                    <option value="Folk" selected>Folk</option>
		                                                                    <option value="Hip hop">Hip hop</option>
		                                                                </select>
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-12">
		                                                            <div class="form-group">
		                                                                <label for="accountTextarea">Bio</label>
		                                                                <textarea class="form-control" id="accountTextarea" rows="3" placeholder="Your Bio data here..."></textarea>
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-12 d-flex flex-sm-row flex-column justify-content-end">
		                                                            <button type="submit" class="btn btn-primary mr-sm-1 mb-1 mb-sm-0">Save
		                                                                changes</button>
		                                                            <button type="reset" class="btn btn-light">Cancel</button>
		                                                        </div>
		                                                    </div>
		                                                </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn grey btn-outline-secondary" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-outline-primary">Save changes</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            
                        </div>
                </div>
            </div>
        </div>
    </div>
</section>
