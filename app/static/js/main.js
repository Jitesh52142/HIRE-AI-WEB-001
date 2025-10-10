document.addEventListener('DOMContentLoaded', function() {
    // --- Multi-Step Form Logic ---
    const multiStepForm = document.getElementById('multiStepForm');
    if (multiStepForm) {
        const nextBtns = multiStepForm.querySelectorAll('.next-btn');
        const prevBtns = multiStepForm.querySelectorAll('.prev-btn');
        const formSteps = multiStepForm.querySelectorAll('.form-step');
        const stepIndicators = document.querySelectorAll('.step-indicator .step');
        const submitBtn = multiStepForm.querySelector('.submit-btn');

        let currentStep = 0;

        // Update step indicators
        function updateStepIndicators(step) {
            stepIndicators.forEach((indicator, index) => {
                indicator.classList.remove('active', 'completed');
                if (index < step) {
                    indicator.classList.add('completed');
                } else if (index === step) {
                    indicator.classList.add('active');
                }
            });
        }

        // Show step with animation
        function showStep(stepIndex) {
            formSteps.forEach((step, index) => {
                step.classList.remove('active');
                if (index === stepIndex) {
                    step.classList.add('active');
                    step.classList.add('animate-slide-up');
                }
            });
            updateStepIndicators(stepIndex);
        }

        nextBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                if (validateStep(currentStep)) {
                    currentStep++;
                    showStep(currentStep);
                }
            });
        });

        prevBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                currentStep--;
                showStep(currentStep);
            });
        });

        multiStepForm.addEventListener('submit', function(e) {
            // Final validation before submitting
            if (!validateStep(currentStep)) {
                e.preventDefault();
                return;
            }
            
            // Show loading state
            if (submitBtn) {
                submitBtn.disabled = true;
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Submitting...';
            }
        });

        function validateStep(stepIndex) {
            let isValid = true;
            const currentStepFields = formSteps[stepIndex].querySelectorAll('input[required], select[required], textarea[required]');
            
            currentStepFields.forEach(field => {
                if (!field.value.trim()) {
                    field.classList.add('is-invalid');
                    isValid = false;
                } else {
                    field.classList.remove('is-invalid');
                }
            });

            if (!isValid) {
                // Show error message with better UX
                const errorDiv = document.createElement('div');
                errorDiv.className = 'alert alert-danger alert-dismissible fade show';
                errorDiv.innerHTML = `
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    Please fill out all required fields in this step.
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                `;
                
                // Remove existing error messages
                const existingError = formSteps[stepIndex].querySelector('.alert-danger');
                if (existingError) {
                    existingError.remove();
                }
                
                formSteps[stepIndex].insertBefore(errorDiv, formSteps[stepIndex].firstChild);
            }
            return isValid;
        }

        // Initialize
        showStep(currentStep);
    }
});

// Add smooth scrolling for better UX
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Add loading states to buttons
document.querySelectorAll('button[type="submit"]').forEach(button => {
    button.addEventListener('click', function() {
        if (this.form.checkValidity()) {
            this.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Processing...';
            this.disabled = true;
        }
    });
});

// Add form validation feedback
document.querySelectorAll('input, select, textarea').forEach(field => {
    field.addEventListener('blur', function() {
        if (this.hasAttribute('required') && !this.value.trim()) {
            this.classList.add('is-invalid');
        } else {
            this.classList.remove('is-invalid');
        }
    });
    
    field.addEventListener('input', function() {
        if (this.classList.contains('is-invalid') && this.value.trim()) {
            this.classList.remove('is-invalid');
        }
    });
});