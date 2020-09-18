import flatpickr from "flatpickr";

const initFlatPickr = () => {
    flatpickr("#transaction_start_date", {});
    flatpickr("#transaction_end_date", {});
    

}

export { initFlatPickr };